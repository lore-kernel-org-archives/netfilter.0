From: Frank Gruellich <frank@der-frank.org>
Subject: Re: snooping port 25 packets
Date: Tue, 5 Oct 2004 00:20:53 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041004222053.GW22098@der-frank.org>
References: <4161C991.1070705@mortonfarms.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4161C991.1070705@mortonfarms.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* Doug Yeager <doug@mortonfarms.com>  4. Oct 04:
> what i really want is a copy of each packet to port 25 sent to a user 
> space program.

# tcpdump -ni $if -w funny_mails.dat -s 2048 port smtp

HTH,
 regards, Frank.
-- 
Sigmentation fault

