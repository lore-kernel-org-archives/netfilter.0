From: Jeff Welling <jeff.welling@gmail.com>
Subject: Trouble POM-ing ROUTE
Date: Tue, 17 Jul 2007 13:18:40 -0700
Message-ID: <9D8084AE-732B-47C1-9D48-46C6BF9CC249@gmail.com>
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:mime-version:content-transfer-encoding:message-id:content-type:to:subject:date:x-mailer:from;
	b=t83c3hZXkujlP7+ASGhyxaBVtVdILzz4YoTeKSS4OxyvZY+aZCudWQSU+2Rz9IES2s0D2oMBUY0mVtjtyfNtpSFJHT5BvKD/bDwe4RN6W3Oh30IHYh34EyO4WdzVm9XKNK2ebFnM52mhDIT6JH41EsAMEO5SpqHNLIETNoyPdiA=
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

Hello all,
I'm in a situation where I need to route traffic based on a specific  
port, our a different interface.  We have a Linux gateway, connected  
to 2 Internet connections, and we want to route some of our packets  
out eth0 and other packets out eth2, traffic which comes from a LAN.

I am aware that there are other ways of doing this, and by all means  
if you have a suggestion about an alternative method please send it  
to me, but I am very interested in ROUTE's potential.

Currently working with;

kernel -	linux-2.6.22.1
iptables - iptables-1.3.6
patch-o-matic-ng - patch-o-matic-ng-20070713   (rotating through  
daily snapshots)

/usr/src/linux  && /usr/src/iptables           are both symlinks to  
the iptables and linux source code dirs.

I run the `runme` executable in POM, and when I get to ROUTE,
a `T` gives me
'./patchlets/ROUTE/linux-2.6.11.patch: ERROR (1 missing files)'

I will continue to wrestle with this by trying alternate snapshots of  
POM-ng, and perhaps attempting to use the 2.6.11 kernel, as it seems  
to make an appearance in the error message there.

If anyone is able to contribute any bits of info to my adventure, I  
would very much appreciate it.
Thanks for your time,
Jeff.

