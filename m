From: "hard__ware" <hard__ware@hotmail.com>
Subject: How to write NAT rules for FTP,IRC and other application layer protocols ?
Date: Mon, 2 Dec 2002 05:46:35 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE512oHzGkzMcvsq9Ic0000183a@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter <netfilter@lists.netfilter.org>

> Hi ,
>
>   How to write NAT rules for FTP,IRC and other
> application layer protocols
> ?
>
> Orca

Gday Orca,

How you going .. :D

I belive what you might be looking for, is the USE of the new Patch-o-Matic
module called 'Helper' you can use this to find packets assoicatted with a
given Conntrack Helper (usually a Protocol at the Application Layer)
like ip_conntrack_ftp or ip_conntrack_irc so you could then maybee
successfully block all FTP transactions that
are not 'pasive' therefore allowing us protection against
ports that the FTP_conntracker does not track ...

by defualt its set to 21, you can change this , and it can be multiple
ports, No more than 8 is Highly Recommened .

My only problem is i can barley get this module working properly , and not
to mention the large amount errors i got
compiling the new Patch-o-Matic Module  ...

Question: Has anyone else had luck with the new Helper
module, Please let me know ...

Have Phun ....

Hard__warE

