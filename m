From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: tcpdump and Iptables
Date: Fri, 3 Sep 2004 11:23:21 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040903102320.GH3755@metastasis.org.uk>
References: <41375ED1.5090400@kdtc.net>
	<20040902180705.GG3755@metastasis.org.uk>
	<4137BDC6.9070303@kdtc.net>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4137BDC6.9070303@kdtc.net>
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

On Fri, Sep 03, 2004 at 08:41:42AM +0800, cc wrote:
> Nick Drage wrote:

> >>If I have iptables running and I do a tcpdump -i eth0,   at what
> >>point is tcpdump listening to the connection?
> >
> >tcpdump will see the packets before IPTables does anything to them.
> 
> Thanks NIck for the info.  Exactly what I wanted to know.

Thanks... though Jason's explanation was rather better :)

tcpdump is an excellent tool, but ( excuse me if I'm stating the obvious
), don't underestimate the usefulness of the logging rules in IPTables
combined with 

tail -f /var/log/$logfile | grep $string_you_are_looking_for

-- 
mors omnia vincit

