From: Lars =?UTF-8?B?VMOkdWJlcg==?= <lars.taeuber@gmx.net>
Subject: nat problem: What's so special with traffic from audibank.de?
Date: Thu, 3 Dec 2009 15:48:31 +0100
Message-ID: <20091203154831.ac38cf77.lars.taeuber@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="Multipart=_Thu__3_Dec_2009_15_48_31_+0100_RFTF30Xu7wfJ5b/O"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.

--Multipart=_Thu__3_Dec_2009_15_48_31_+0100_RFTF30Xu7wfJ5b/O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi there.

Since some years I have experience with the firewall systems inside linux.
But now I have a case where I don't know how to debug this.

I exchanged my hand written firewall rules with rules generated from fwbuilder 3.0.5. The kernel used is the one from ubuntu 8.04 (2.6.24-25-server).

$ iptables -V
iptables v1.3.8

Maybe it's an already known bug in iptables from this old kernel?

All http(s) traffic works exept the one from audibank.de. The start side doesn't show up when called from a computer on the natted side of the local network. When called from the computer doing the firewall/nat it just works.

The phenomenon on a natted computer:

============================== snip ========================
$ LANG=C wget -d audibank.de
DEBUG output created by Wget 1.11.4 on linux-gnu.
[...]
---request end---
HTTP request sent, awaiting response...
============================== snip ========================

All other online banking sides just work.

Here are (hapefully all) the relevant rules that are generated from fwbuilder (using iptables-restore):

echo :INPUT DROP   [0:0]
echo :FORWARD DROP [0:0]
echo :OUTPUT DROP  [0:0]
echo "-A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT"
echo "-A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT"
echo "-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT"

echo "-A OUTPUT   -m state --state INVALID  -j DROP"
echo "-A INPUT    -m state --state INVALID  -j DROP"
echo "-A FORWARD  -m state --state INVALID  -j DROP"

echo ":In_RULE_0 - [0:0]"
echo "-A INPUT    -i ppp0  -s 192.168.4.0/24  -m state --state NEW  -j In_RULE_0 "
echo "-A FORWARD  -i ppp0  -s 192.168.4.0/24  -m state --state NEW  -j In_RULE_0 "
echo "-A In_RULE_0  -j DROP "

echo "-A OUTPUT  -o ppp0 -p tcp -m tcp  -m multiport  --dports 53,80,443,22  -m state --state NEW  -j ACCEPT "
echo "-A OUTPUT  -o ppp0 -p udp -m udp  --dport 53  -m state --state NEW  -j ACCEPT "

echo "-A INPUT    -s 192.168.4.0/24  -m state --state NEW  -j ACCEPT "
echo "-A OUTPUT   -s 192.168.4.0/24  -m state --state NEW  -j ACCEPT "
echo "-A FORWARD  -s 192.168.4.0/24  -m state --state NEW  -j ACCEPT "

echo "-A POSTROUTING -o ppp0  -s 192.168.4.0/24 -j MASQUERADE  "

echo 1 > /proc/sys/net/ipv4/ip_forward




Attached is the tcpdump of the http traffic related to audibank.de

What's wrong? Can someone enlighten me please?
Best regards.
Lars

--Multipart=_Thu__3_Dec_2009_15_48_31_+0100_RFTF30Xu7wfJ5b/O
Content-Type: application/octet-stream;
 name="ppp1.dump"
Content-Disposition: attachment;
 filename="ppp1.dump"
Content-Transfer-Encoding: base64

1MOyoQIABAAAAAAAAAAAAAACAABxAAAAyRAPS0p9AQBMAAAATAAAAAAEAgAAAAAAAAAAAAAACABF
AAA8JdFAAD8GpkRZ9zMhwnIgHLi4AFAUBbsVAAAAAKACFtCZ+gAAAgQFtAQCCAoAp57EAAAAAAED
AwfJEA9LrT0CADwAAAA8AAAAAAACAAAAAAAAAAAAAAAIAEUAACwl0UAAdgZvVMJyIBxZ9zMhAFC4
uIqhIMYUBbsWYBJHGK3LAAACBAW0yRAPS8E+AgA4AAAAOAAAAAAEAgAAAAAAAAAAAAAACABFAAAo
JdJAAD8GpldZ9zMhwnIgHLi4AFAUBbsWiqEgx1AQFtD10AAAyRAPS68/AgCbAAAAmwAAAAAEAgAA
AAAAAAAAAAAACABFAACLJdNAAD8GpfNZ9zMhwnIgHLi4AFAUBbsWiqEgx1AYFtCrVgAAR0VUIC8g
SFRUUC8xLjANClVzZXItQWdlbnQ6IFdnZXQvMS4xMS40DQpBY2NlcHQ6ICovKg0KSG9zdDogYXVk
aWJhbmsuZGUNCkNvbm5lY3Rpb246IEtlZXAtQWxpdmUNCg0KyRAPS6oMAwA4AAAAOAAAAAAAAgAA
AAAAAAAAAAAACABFAAAo6VpAADUG7M7CciAcWfczIQBQuLiKoSDHFAW7eVAQFtD1bQAAyRAPS34U
AwD6AQAA+gEAAAAAAgAAAAAAAAAAAAAACABFAAHq6VtAADUG6wvCciAcWfczIQBQuLiKoSDHFAW7
eVAYFtCt1gAASFRUUC8xLjEgMzAyIEZvdW5kDQpTZXQtQ29va2llOiBBbHRlb25QPTNjOWY5YWEy
M2M5ZjkyZDVhNWQ2YmE2MDsgcGF0aD0NCkRhdGU6IFRodSwgMjYgTm92IDIwMDkgMjM6MzU6MzQg
R01UDQpTZXJ2ZXI6IEFwYWNoZQ0KTG9jYXRpb246IGh0dHA6Ly9hdWRpYmFuay5kZS9pbmRleC5w
aHANCkNvbnRlbnQtTGVuZ3RoOiAyMTINCktlZXAtQWxpdmU6IHRpbWVvdXQ9MTUsIG1heD0xMDAN
CkNvbm5lY3Rpb246IEtlZXAtQWxpdmUNCkNvbnRlbnQtVHlwZTogdGV4dC9odG1sOyBjaGFyc2V0
PWlzby04ODU5LTENCg0KPCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9JRVRGLy9EVEQgSFRNTCAy
LjAvL0VOIj4KPGh0bWw+PGhlYWQ+Cjx0aXRsZT4zMDIgRm91bmQ8L3RpdGxlPgo8L2hlYWQ+PGJv
ZHk+CjxoMT5Gb3VuZDwvaDE+CjxwPlRoZSBkb2N1bWVudCBoYXMgbW92ZWQgPGEgaHJlZj0iaHR0
cDovyRAPSzMWAwA4AAAAOAAAAAAEAgAAAAAAAAAAAAAACABFAAAoJdRAAD8GplVZ9zMhwnIgHLi4
AFAUBbt5iqEiiVAQGSDxWwAAyRAPS2cYAwBtAAAAbQAAAAAAAgAAAAAAAAAAAAAACABFAABd6VtA
ADUG7JjCciAcWfczIQBQuLiKoSKJFAW7eVAYFtCIiAAAL2F1ZGliYW5rLmRlL2luZGV4LnBocCI+
aGVyZTwvYT4uPC9wPgo8L2JvZHk+PC9odG1sPgrJEA9LGxkDADgAAAA4AAAAAAQCAAAAAAAAAAAA
AAAIAEUAACgl1UAAPwamVFn3MyHCciAcuLgAUBQFu3mKoSK+UBAZIPEmAADJEA9LWxoDAKQAAACk
AAAAAAQCAAAAAAAAAAAAAAAIAEUAAJQl1kAAPwal51n3MyHCciAcuLgAUBQFu3mKoSK+UBgZIBGn
AABHRVQgL2luZGV4LnBocCBIVFRQLzEuMA0KVXNlci1BZ2VudDogV2dldC8xLjExLjQNCkFjY2Vw
dDogKi8qDQpIb3N0OiBhdWRpYmFuay5kZQ0KQ29ubmVjdGlvbjogS2VlcC1BbGl2ZQ0KDQrJEA9L
pFgEAG0AAABtAAAAAAACAAAAAAAAAAAAAAAIAEUAAF3pXEAANQbsl8JyIBxZ9zMhAFC4uIqhKHIU
BbvlUBAW0N9cAABvcmRlciI+PC9kaXY+CjxkaXYgaWQ9InBhZ2UiPgoJPGRpdiBpZD0icGFnZWhl
YWQiPgoJCckQD0uGWQQAOAAAADgAAAAABAIAAAAAAAAAAAAAAAgARQAAKCXXQAA/BqZSWfczIcJy
IBy4uABQFAW75YqhIr5QEBkg8LoAAMkQD0s8IQgAbQAAAG0AAAAAAAIAAAAAAAAAAAAAAAgARQAA
XeleQAA1BuyVwnIgHFn3MyEAULi4iqEochQFu+VQEBbQ31wAAG9yZGVyIj48L2Rpdj4KPGRpdiBp
ZD0icGFnZSI+Cgk8ZGl2IGlkPSJwYWdlaGVhZCI+CgkJyRAPSyYiCAA4AAAAOAAAAAAEAgAAAAAA
AAAAAAAACABFAAAoJdhAAD8GplFZ9zMhwnIgHLi4AFAUBbvliqEivlAQGSDwugAAyhAPS8t/AABt
AAAAbQAAAAAAAgAAAAAAAAAAAAAACABFAABd6V9AADUG7JTCciAcWfczIQBQuLiKoShyFAW75VAQ
FtDfXAAAb3JkZXIiPjwvZGl2Pgo8ZGl2IGlkPSJwYWdlIj4KCTxkaXYgaWQ9InBhZ2VoZWFkIj4K
CQnKEA9LuIAAADgAAAA4AAAAAAQCAAAAAAAAAAAAAAAIAEUAACgl2UAAPwamUFn3MyHCciAcuLgA
UBQFu+WKoSK+UBAZIPC6AADLEA9LKX8AAG0AAABtAAAAAAACAAAAAAAAAAAAAAAIAEUAAF3pYEAA
NQbsk8JyIBxZ9zMhAFC4uIqhKHIUBbvlUBAW0N9cAABvcmRlciI+PC9kaXY+CjxkaXYgaWQ9InBh
Z2UiPgoJPGRpdiBpZD0icGFnZWhlYWQiPgoJCcsQD0swgAAAOAAAADgAAAAABAIAAAAAAAAAAAAA
AAgARQAAKCXaQAA/BqZPWfczIcJyIBy4uABQFAW75YqhIr5QEBkg8LoAAM0QD0vlfQAAbQAAAG0A
AAAAAAIAAAAAAAAAAAAAAAgARQAAXelhQAA1BuySwnIgHFn3MyEAULi4iqEochQFu+VQEBbQ31wA
AG9yZGVyIj48L2Rpdj4KPGRpdiBpZD0icGFnZSI+Cgk8ZGl2IGlkPSJwYWdlaGVhZCI+CgkJzRAP
S+F+AAA4AAAAOAAAAAAEAgAAAAAAAAAAAAAACABFAAAoJdtAAD8Gpk5Z9zMhwnIgHLi4AFAUBbvl
iqEivlAQGSDwugAA0RAPS0N/AABtAAAAbQAAAAAAAgAAAAAAAAAAAAAACABFAABd6WJAADUG7JHC
ciAcWfczIQBQuLiKoShyFAW75VAQFtDfXAAAb3JkZXIiPjwvZGl2Pgo8ZGl2IGlkPSJwYWdlIj4K
CTxkaXYgaWQ9InBhZ2VoZWFkIj4KCQnREA9LJ4AAADgAAAA4AAAAAAQCAAAAAAAAAAAAAAAIAEUA
ACgl3EAAPwamTVn3MyHCciAcuLgAUBQFu+WKoSK+UBAZIPC6AADZEA9LGn4AAG0AAABtAAAAAAAC
AAAAAAAAAAAAAAAIAEUAAF3pY0AANQbskMJyIBxZ9zMhAFC4uIqhKHIUBbvlUBAW0N9cAABvcmRl
ciI+PC9kaXY+CjxkaXYgaWQ9InBhZ2UiPgoJPGRpdiBpZD0icGFnZWhlYWQiPgoJCdkQD0sYfwAA
OAAAADgAAAAABAIAAAAAAAAAAAAAAAgARQAAKCXdQAA/BqZMWfczIcJyIBy4uABQFAW75YqhIr5Q
EBkg8LoAAA==

--Multipart=_Thu__3_Dec_2009_15_48_31_+0100_RFTF30Xu7wfJ5b/O--
