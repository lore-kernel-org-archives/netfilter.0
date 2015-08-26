From: Scott Ruckh <netfilter@gemneye.org>
Subject: Centos 7; Ulogd 2.05; MySQL; NFLOG
Date: Wed, 26 Aug 2015 08:02:00 -0700
Message-ID: <bfd2fe0c8901dbb9a7a66138877401e9@gemneye.org>
Reply-To: netfilter@gemneye.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gemneye.org;
	s=default; t=1440601325;
	bh=TLTtfEBJqnplkH0OMXK1u1dYO6yal35hLICf+7qmgaU=;
	h=Date:From:To:Subject:Reply-To:From;
	b=hza9SpviDEncO7h6TEl2opSXd//Us2mKY/CnQ7jHQMgz/OoZ6IPX32OkGHfS6eom/
	 dKkiofLaeIQGHRuAXhzMaHJOjpgj8xeLt7gHSrcKMs/Dh6rzIIY0npPeZE5LkWuSYy
	 I2BPSvtqDA+2orXpJ75Svob4pV2v/wPf6VZcXLpw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gemneye.org;
	s=default; t=1440601320;
	bh=TLTtfEBJqnplkH0OMXK1u1dYO6yal35hLICf+7qmgaU=;
	h=Date:From:To:Subject:Reply-To:From;
	b=DAJchzJV2TBz1xEWDaDptOZ1QjdM6IiCMOeAOyxOPKNGWmzbufayVS5uWOf7a0zCO
	 trU7QLrSSqK0PY6+1CsN3meZbF7Gin0+OY2dAoHOqw2jWV8M2AcLcrPpY/profe7Qk
	 gX6pF4DIPFOsVyUZUiALLz03ptLUIb8ONtO7jq8I=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am trying to get Ulogd (2.05 compiled from git) working with MySQL 
(mariadb-5.5.44-1).

I created a DB (ulogd).  Populated the database using the 
mysql-ulogd2.sql schema file.  I created a user (ulogd_user) with full 
access to that database.

/etc/ulogd.conf

<SNIP>
.
.
plugin="/usr/lib64/ulogd/ulogd_output_MYSQL.so"
stack=log2:NFLOG,base1:BASE,ifi1:IFINDEX,ip2bin1:IP2BIN,mac2str1:HWHDR,mysql1:MYSQL

[log2]
group=1

[mysql1]
db="ulogd"
host="localhost"
user="ulogd_user"
table="ulog"
pass="secret"
procedure="INSERT_PACKET_FULL"
.
.
</SNIP>

  ls -ld /usr/lib64/ulogd/ulogd_output_MYSQL.so
-rwxr-xr-x. 1 root root 63972 Aug 25 16:38 
/usr/lib64/ulogd/ulogd_output_MYSQL.so

I also enabled LOGEMU:
stack=log1:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRINTPKT,emu1:LOGEMU

[log1]
group=0

[emu1]
file="/var/log/ulogd/ulogd_syslogemu.log"
sync=1

Below is the output from ulogd.log when starting ulogd.
/var/log/ulogd/ulogd.log
<SNIP>
Tue Aug 25 16:39:53 2015 <5> ulogd.c:843 building new pluginstance 
stack: 
'log1:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRINTPKT,emu1:LOGEMU'
Tue Aug 25 16:39:53 2015 <5> ulogd_inppkt_NFLOG.c:503 forcing unbind of 
existing log handler for protocol 2
Tue Aug 25 16:39:53 2015 <5> ulogd_inppkt_NFLOG.c:503 forcing unbind of 
existing log handler for protocol 10
Tue Aug 25 16:39:53 2015 <5> ulogd_inppkt_NFLOG.c:503 forcing unbind of 
existing log handler for protocol 7
Tue Aug 25 16:39:53 2015 <5> ulogd.c:843 building new pluginstance 
stack: 
'log2:NFLOG,base1:BASE,ifi1:IFINDEX,ip2bin1:IP2BIN,mac2str1:HWHDR,mysql1:MYSQL'
Tue Aug 25 16:39:53 2015 <5> ../../util/db.c:151 (re)configuring
Tue Aug 25 16:39:53 2015 <5> ../../util/db.c:206 starting
</SNIP>

The LOGEMU is working as expected and data is being written to 
/var/log/ulogd/ulogd_syslogemu.log.

I have logged into MySQL successfully with the user credentials 
specified in the [mysql1] stanza.  I was not certain which "table" to 
use, but I read on-line that the ulog "view" was the correct table to 
use.

As logging to file is working, I am assuming NFLOG is working, iptables 
configured correctly, Ulogd is up and running, and at least one output 
plugin is working correctly.  Unfortunately, nothing is getting logged 
to MySQL database.

Can you find the error in this configuration?

Thank You
Scott



