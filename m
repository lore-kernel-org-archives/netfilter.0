From: "naren@deeproot.co.in" <naren@deeproot.co.in>
Subject: re:RE: iptables counters and proc
Date: Tue, 1 Oct 2002 08:37:52 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4910-220021021123752318@M2W098.mail2web.com>
Reply-To: naren@deeproot.co.in
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: sumit@elitecore.com, netfilter@lists.netfilter.org

Hi

First of all, thanks for your reply=2E "ipac-ng" is more than what I requi=
re,
right now I am not looking at the billing and other features that is
provides=2E But its a excellent piece of software=2E

Here is  one more thing that is was looking out for=2E Using iptables the
protocols like tcp,udp can be measured both for the whole network and
single host based=2E But how can i measure the data with respect to its
application like http ftp nfs smtp imap=2E=2E I had seen lots of people
plotting of graphs with separate graphs for http,ftp, etc=2E

Is there any library that i can use to do the above ?

Please help me with this=2EForgive my ignorance=2E

Bye=20
narendra

Original Message:
-----------------
From: Sumit Pandya sumit@elitecore=2Ecom

Hi,
=09Take a look on ipac-ng available from freshmeat=2E We have implemented =
here
for our ISP division and satisfies all of our need=2E
-- Sumit

> From: Narendra Prabhu B <naren@deeproot=2Eco=2Ein>
>
> hi
>
> pls excuse me know if this idea is silly =2E=2E=2E=2E=2E=2E
>
> i am working on iptables library "libiptc" =2E=2E to count the number
> bytes crossing a chain =2E=2E=2E i am targeting the program for ISPs
> =2E=2E=2E=2E could be used to draw customized graphs=2E=2E=2E=2E=2E i am=
 using
> libiptc for counting
> but how do i write the data in the proc filesystem =2E=2E i thought
> it was more modular to write the data in the proc filesystem=2E But
> i have not done any kernel programming before =2E=2E can anyone tell
> me how to go about pls send the urls of the docs i am suppose to
> read to do the above =2E=2E
>
> bye
> narendra


--------------------------------------------------------------------
mail2web - Check your email from the web at
http://mail2web=2Ecom/ =2E



