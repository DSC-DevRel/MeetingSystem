package com.example.admin;

import com.fasterxml.jackson.annotation.JsonProperty;

public class empListData {
	@JsonProperty("id")
	private String id;
	@JsonProperty("name")
    private String name;
	@JsonProperty("kana")
    private String kana;
	@JsonProperty("depart")
    private String depart;


    public empListData(String id, String name, String kana, String depart) {
        this.id = id;
        this.name = name;
        this.kana = kana;
        this.depart = depart;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getKana() {
        return kana;
    }

    public String getDepart() {
        return depart;
    }

    public static empListData[] empJson() {


    	try {
		  String[] result = PostgresConect.employeeListSelect("0");

		  int count = result.length; // resultの長さを取得するコード

		  int i = 0;
		  // empListDataの配列を作成
          empListData[] aryEmploye = new empListData[count];
		  while (count > i) {
			String tmp = "";
			String[] tmpSplit = new String[3];
			tmp = result[i];
			tmpSplit = tmp.split(",");

			String strID = tmpSplit[0];
			String strName = tmpSplit[1];
			String strKananame = tmpSplit[2];
			String intDepart = tmpSplit[3];

			aryEmploye[i] = new empListData(strID, strName, strKananame, intDepart);

            i += 1;
		  }

          // ObjectMapperを使用してJSONに変換
          //ObjectMapper objectMapper = new ObjectMapper();
          //String jsonData = objectMapper.writeValueAsString(aryEmploye);
          //System.out.println(jsonData);

          return aryEmploye;

        } catch (Exception e) {
          e.printStackTrace();
          return null;
        }

	}

}
