From: skydive <skydive@megamail.pt>
Subject: (no subject)
Date: Fri, 21 Nov 2003 12:29:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069417756.3fbe051c48a7d@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: text/plain; charset="iso-8859-1"
To: rob@sterenborg.info
Cc: netfilter@lists.netfilter.org

hi rob and tanx in advance for all your effort! it was=20
realy nice of you!


  ->  iptables -A INPUT -m state --state=20
RELATED,ESTABLISHED -j ACCEPT

if i understand this correctly, this rule is what it=20
takes to accept all related connections that are=20
caught and just related with any kind of connection=20
(correct me if i'm wrong.. :) )... it doesn=B4t matter=20
=66rom where it comes or where it goes. just being=20
related is enough for the rule to catch and accept, in=20
this case, the related traffic that came from the=20
www.hotmail.com connection... ;)) without the need to=20
specify the --dport or --sport.

hotmail.com was just an exemple! many urls will follow=20
since i'll be accepting almost all kind os urls except=20
those of porno ones, ftp ones... and all those kind of=20
thing that can distract one from his work !! ;))=20
(hehe!!)

about the output chain... i had it to accept, so i=20
assume i don't need those rules about the output=20
chain... is that correct..!? :))

thank you very much, for your time and for your=20
words ;)

really apreciate it!




skydive!

-------------------------------------------------
Email Enviado utilizando o servi=E7o MegaMail


