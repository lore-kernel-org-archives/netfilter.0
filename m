From: Husnu Demir <hdemir@metu.edu.tr>
Subject: conntrack module question?
Date: Fri, 05 Nov 2010 11:21:50 +0200
Message-ID: <4CD3CCAE.3060707@metu.edu.tr>
Reply-To: hdemir@metu.edu.tr
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000501090907010105070309"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Netfilter Developer Mailing List <netfilter@vger.kernel.org>

This is a multi-part message in MIME format.
--------------000501090907010105070309
Content-Type: text/plain; charset=ISO-8859-9
Content-Transfer-Encoding: 7bit


Hi,

I am using conntrack module for a while. As suggested configuration I do add ;


-A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -m conntrack --ctstate INVALID -j DROP

At the top of the configuration. After that I added the drop rule as;


-A FORWARD -i eth0 -o eth1 -m set --match-set STOPALL src -j DROP

This rule is not statefull and should drop everything. I added an IP address,
174.142.179.235 a SPAMMER, to stop its communication. But it did no stop. As far
as I know in TCP connection the packets is not in ESTABLISHED state but could be
RELATED :(.

I wrote "drop everything from STOPALL list", but the connection is not dropped. If
I wrote the the DROP statement above the 1st rule, it will drop all the
connection. What is wrong? I do not want to write DROP statement to the top?


Thanks.



--------------000501090907010105070309
Content-Type: text/x-vcard; charset=utf-8;
 name="hdemir.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="hdemir.vcf"

begin:vcard
fn:Husnu Demir
n:Demir;Husnu
email;internet:hdemir@metu.edu.tr
tel;work:+903122103330
tel;fax:+903122103303
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------000501090907010105070309--
