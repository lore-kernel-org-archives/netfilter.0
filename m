From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: ssh
Date: Wed, 14 Jul 2004 11:26:10 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2E314DE03538984BA5634F12115B3A4E62E89F@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Koyama Mituru <netfilter@gvelo.ddnn.jp>, netfilter@lists.netfilter.org

Should all incoming ports that relate to a service such as SSH, FTP use
-m state --state NEW?=20

I have never used this with iptables; but I remember using it with
ipfilter.

What are the security implications (if any) of not using -m state
--state NEW?



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Koyama Mituru
Sent: Wednesday, July 14, 2004 10:26 AM
To: netfilter@lists.netfilter.org
Subject: Re: ssh

From: "IT Clown" <iptables@mailbox.co.za>
Subject: ssh
Date: Wed, 14 Jul 2004 16:15:22 +0200

> How do i allow ssh in from the internet, thanks?

iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT

--=20
Koyama Mituru    netfilter@gvelo.ddnn.jp


