From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: mangle tables.
Date: Tue, 10 Sep 2002 12:09:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209101109.g8AB9Sv06772@vulcan.rissington.net>
References: <FLEKIPPLAEDMJMOOBBDPCECJCOAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPCECJCOAA.stewart.thompson@shaw.ca>
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
To: netfilter@lists.samba.org

On Tuesday 10 September 2002 11:41 am, Stewart Thompson wrote:

> HI:
>
> 	Have a look at the traversal diagram in Section 3 of
> Oskar Andreasson's Tutorial. It explains it quite well.

Yes, indeed it does.   However, it might not be quite correct for the version 
of netfilter you are running - there have been a couple of subtle changes 
between recent versions of netfilter.

Therefore I agree and thoroughly recommend Oskar's tutorial for getting an 
understanding of how netfilter works in principle, however if the question of 
what order the chains & tables are traversed is really important to you for 
some reason, I still recommend testing it on your own machine so that you 
know exactly what your system does.

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

