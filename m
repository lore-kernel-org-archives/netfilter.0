From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ICMP conntrack
Date: Fri, 18 Oct 2002 11:22:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210181022.g9IAMcL28022@vulcan.rissington.net>
References: <Pine.LNX.4.44.0210171713000.6045-100000@altaica.tigerknight.org> <200210180952.g9I9qEL27957@vulcan.rissington.net> <3DAFDD4F.C24F44B6@nestac.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DAFDD4F.C24F44B6@nestac.com>
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
To: netfilter@lists.netfilter.org

On Friday 18 October 2002 11:07 am, Vincent Lim wrote:

> > > So, for ICMP requests, you have some kind of conntrack, based on ICMP
> > > sequence number. For ICMP errors, conntrack tries to associate them to
> > > an existing entry.
> >
> > ICMP sequence number ???   What's that ?
>
> Results of a ping to www.ncftpd.com :
>
> 64 bytes from ncftpd.com (209.197.102.38): icmp_seq=11055 ttl=44
> time=311.029 msec
> 64 bytes from ncftpd.com (209.197.102.38): icmp_seq=11056 ttl=44
> time=308.126 msec
> 64 bytes from ncftpd.com (209.197.102.38): icmp_seq=11057 ttl=44
> time=308.430 msec
> 64 bytes from ncftpd.com (209.197.102.38): icmp_seq=11058 ttl=44
> time=302.321 msec
>
> And the entries in conntrack related to the above is:
> icmp     1 29 src=192.168.1.229 dst=209.197.102.38 type=8 code=0
> id=59475 src=209.197.102.38 dst=192.168.1.229 type=0 code=0 id=59475
> use=1

Oh - okay - I see what you mean now.   I've just looked up the specs for ICMP 
echo request and indeed there is a sequence number in the "message-code 
specific extra information" field following the first four bytes.

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

