From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: DNATing Windows File Sharing
Date: Mon, 18 Jul 2005 11:20:49 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507181120001.14336@yvahk01.tjqt.qr>
References: <1121674536.1554.16.camel@sadusbox.hostname>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1121674536.1554.16.camel@sadusbox.hostname>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Sadus ." <sadus@swiftbin.net>
Cc: netfilter@lists.netfilter.org

>Hello,
>I would like to enable the right ports and DNAT the requests for File
>Sharing on a internal windows box. The win2k3 has Active Directory
>enabled and i want users to type \\domainname.com which will popup a
>user/pass dialog and let them access the file server.
>
>I did the following, but it doesn't seem to work:
>iptables -t nat -A PREROUTING -j DNAT -i eth0 -p tcp --dport 139 --to
>192.168.1.2:139 
>assuming "139" is NetBios

Also try 445 instead of 139.

Then, if that still does not work, you maybe need to forward UDP 137.



Jan Engelhardt
-- 

