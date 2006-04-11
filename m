From: Mike Auty <mike.auty@gmail.com>
Subject: Re: libnetfilter_queue conditions required to rewrite packets...
Date: Tue, 11 Apr 2006 11:58:57 +0100
Message-ID: <443B8BF1.2090907@gmail.com>
References: <44348A27.60602@gmail.com>	
	<859616420604052330gc251080q95738ef1d112b465@mail.gmail.com>
	<859616420604070655n35ced2eau5c6968f5d2e3f029@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <859616420604070655n35ced2eau5c6968f5d2e3f029@mail.gmail.com>
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
To: David Vogt <beunlovable@gmail.com>
Cc: netfilter@lists.netfilter.org

Ok,
	So yesterday I needed to use a small program to rewrite packets flowing 
through my transparent bridge.  I started using the an ipq 
implementation and after a bit of jiggery pokery fixing up all the 
checksums, it seemed to be working a treat.  I then knocked up an 
nfqueue implementation using the code I'd been writing that did exactly 
the same job, and using the the subversion copies of libnetfilter_queue 
(0.0.12) and libnfnetlink (0.0.16), I did manage to mangle the packets 
successfully...
	I still don't seem to be able to send out packets with a broken 
checksum, but I haven't yet verified whether that's the target end 
dropping them or the linux kernel killing them before they get on the 
wire.  I hope this helps...
	Mike  5:)

