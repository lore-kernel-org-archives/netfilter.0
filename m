From: "Robert Gil" <h4idz@hotmail.com>
Subject: syn flooding issue
Date: Tue, 13 Apr 2004 21:58:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY12-F72tCx1Dy3riC00044083@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

ive been testing syn flooding and for some reason the rules drop the=20
packets.... yet connections still time out like it was being flooded...=20
perhaps i missed something...

the input chain policy is DROP


# Syn Protection

iptables -N syn-flood
iptables -A INPUT -p tcp --syn -j syn-flood
iptables -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
iptables -A syn-flood -j DROP
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

###############################################
ive tested this by using hping2 with the following commands:

hping2 -S -i u100 -p 80 xxx.xxx.xxx.xxx
hping2 -S -i u100 -w 0 -p 80 xxx.xxx.xxx.xxx

whenever i flood it the webserver just times out when i try to open a page =

in a browser... i would assume the rules are incorrect but im baffled as to=
=20
what i did wrong... should these rules come before opening any ports? (trie=
d=20
it... same thing)  perhaps its just in the wrong order... if someone could =

just throw me a hint or a rule or two that would be great

~Rob

_________________________________________________________________
FREE pop-up blocking with the new MSN Toolbar =96 get it now!=20
http://toolbar.msn.com/go/onm00200415ave/direct/01/


