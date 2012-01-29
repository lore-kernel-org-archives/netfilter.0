From: =?ISO-8859-2?Q?Marcin_Miros=B3aw?= <marcin@mejor.pl>
Subject: [ulogd2] Small fix for table ulog2 structure for postgresql and two
 other questions
Date: Sun, 29 Jan 2012 20:35:52 +0100
Message-ID: <4F259F98.3000500@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=4bCma0LnMRRmK3nWmyGbVorb9BWrmGHKNMyP16fifK4=;
	b=CE9zo2qi6dKsHCja4WinEGlW6ciFYykpRCVoSS4QH0rWwNmxL9P0rcHG4pw8H5g+VtakBUAb7AIQT/hIbdbs+TrdeaiXq4/7vHZdywPUKCKQ4TcxlUSK9r0Fp9FjWhfL;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,
1. There is a small issue when we create databse structure in 
postgresql. Table "ulog2" has column "timestamp" with default value 
"now". This is incorrect. It means all tuples in this table will have 
the same value, "now" of time when table was created. I guess it isn't 
usefull. This small patch resolves this issue.

--- a/doc/pgsql-ulogd2.sql
+++ b/doc/pgsql-ulogd2.sql
@@ -61,7 +61,7 @@ CREATE TABLE ulog2 (
    ip_fragoff smallint default NULL,
    label smallint default NULL,
    mac_id bigint default NULL,
-  timestamp timestamp NOT NULL default 'now'
+  timestamp timestamp NOT NULL default now()
  ) WITH (OIDS=FALSE);

  CREATE INDEX ulog2_oob_family ON ulog2(oob_family);


2. Ulogd2 obtains list of columns from table defined in config. And 
fails if can't match column name with any name of output key in used 
plugins. Also ignores first column from table which isn't mentioned in 
doc. So when we want to have custom columns in table we have to create 
additional database object "view" to provide proper information for 
ulogd2. Meseems it can be done in a bit cleaner way: let columns with 
first char of name "_" (underscore) will be ignored by stack. In this 
case "view" wouldn't be need to be used.

3. File README contains information about homepage and mailinglist. It 
seems outdated.

(I hope this malinglist is correct for ulogd2)
Regards,
Marcin
