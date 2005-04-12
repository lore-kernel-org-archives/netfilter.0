From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Logging suggestions
Date: Tue, 12 Apr 2005 10:33:57 -0500
Message-ID: <425BEA65.5030203@riverviewtech.net>
References: <0aa401c53f73$5c19a2a0$09603fca@southern>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <0aa401c53f73$5c19a2a0$09603fca@southern>
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
To: hareram <hareram@sol.net.in>
Cc: netfilter@lists.netfilter.org

Oh, my, that will be tough.  Keep in mind that you will quite likely be generating more data doing the log than you will be having pass through your box, especially if the traffic has a small payload.  I would really be tempted to look at using TCPDump to dump everything to a file and then parse the file.  I don't think the LOG or ULOG target are designed for such high traffic volumes.  Even if they were, LOG logs to SYSLOG, which it in and of it's self is not meant for that high of a volume.  I've never messed with ULOG so I can't say.  Are you needing payload as well or just header information?  I still think TCPDump or some form of an IDS would be a better bet.  Try taking a look at Snort and see if that will come close to what you need.



Grant. . . .

hareram wrote:
> Hi all
> 
> I have large  capacity link like STM with my provider
> Iam planning to log the every packet, source IP , Dest IP, Src port, 
> Dest port , Type of Service
> what kind of system configuration recommended
> 
> what kind of  logging system is better ?
> iam trying to use Ulogd and try to log every packet, but the kernel 
> crashes after 5min
> 
> i have Xeon 1GB ram with 40GB Scsi HDD running FC1
> 
> How can logging whole history of the packet with the better performance
> with out any payload to the user access, and transparently
> 
> any suggestions will be appreciated
> 
> hare
> 
> 
> 

