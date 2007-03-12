From: "hitesh sharma" <engineerhitesh@gmail.com>
Subject: Problem @ SNAT and FTP ...plz help .....
Date: Mon, 12 Mar 2007 15:46:12 +0530
Message-ID: <58cbfaa70703120316w7b4755cdgab49769df7969753@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=ueA1GNDfabXRgI5K0AinJH36n6fvUi1Pn2xNEZ5Zd3Bk6Dd5F4eSTFvNbkHlNTkJtYe+XIzsgmRPZNf11pT0DDEmJN+pOt2BA/9DcAYlZJu5yUalgzhaL/Eri3zmit1LrsUD8A5ejSqtDLvUJgx8Y4iQ4rh1ysjXPdbQR/exfJc=
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hello all ,

1.     actually i m doing SANT to convert my 10.10.189.125 ip  to
192.168.14.190 to make the ftp connection in the same LAN. So , doing
the same , i m SANTind 10.10.189.125 to 192.168.15.190.

but i want to know that , if i m doing the SNAT  one of the inteface ,
then will i have to do DNAT at the same interface to convert the
destination address (in the packet coming form lan to my machine i.e.
192.168.15.190) into my machine's address i.e 10.10.189.125.??

or kernel will take care of that ?

2. agian , i want to make only ftp from my machine to any to LAN
machine , so for that i wrote some rule set , everything is going well
, but when i ftp to lan machine , it makes the connection successfully
, but when i run "dir" or "ls " command , it shows nothing and behaves
like hang.

so , plz help me .............

