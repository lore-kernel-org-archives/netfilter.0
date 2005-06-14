From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Portforwading and FTP
Date: Tue, 14 Jun 2005 15:57:29 +0200
Message-ID: <20050614135832.38D488EDCEB@smtp.sterenborg.info>
References: <000d01c570a0$bfc95c10$b91ed0da@admisyuzz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <000d01c570a0$bfc95c10$b91ed0da@admisyuzz>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I would like to seek some help from expert regarding on port 
> forwarding and ftp.
> i have setup the POSTROUTING and PREROUTING in iptables 
> config to forward packet to ftp server. Then i try ftp client 
> to access my ftp server. I successfully access my ftp server 
> but i have error message come out 502: ILLEGAL port command. 
> Anybody can help me how to solve this issue.

Did you 'modprobe ip_conntrack_ftp' and 'modprobe ip_nat_ftp' ?


Gr,
Rob


