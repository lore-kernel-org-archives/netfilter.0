From: =?iso-8859-1?B?SOlsaW8gRHViZXV4?= <hdubeux@hotmail.com>
Subject: Allow access trought a bridge
Date: Mon, 04 Nov 2002 13:09:14 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F170idBhYHQnCcdAPi30000a7b4@hotmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

I Have a Bridge and CBQ on my net. I have to:

1 - Allow external access to some IP.
2 - Drop the non alloed IP.

I Gave an valid IP behind my bridge that i can=B4t access. This is my table:

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p all -s <IP> -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j DROP

Whith these rulesets i got what i want, for example i can ping my router bu=
t=20
i can=B4t ping an IP in the same range as my router tahat is behind the=20
bridge.

PLZ HELP ME.

----------------------
H=E9lio Dubeux Neto




_________________________________________________________________
MSN Hotmail, o maior webmail do Brasil. http://www.hotmail.com


