From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: RE: Yahoo Messenger
Date: Mon, 7 Oct 2002 13:28:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021007132802.B3805@funkyjesus.org>
References: <E17yR1F-0007tl-00@kashyyyk.netfilter.org>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <E17yR1F-0007tl-00@kashyyyk.netfilter.org>; from harvey@hnu.edu.ph on Sat, Oct 12, 2002 at 08:58:20PM +0800
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, Oct 12, 2002 at 08:58:20PM +0800, Halasan . Harvey wrote:

> > So, if you *don't* want users to connect to Yahoo Messenger, can't you
> > do :
> > 
> > # If users are NAT-ed
> > iptables -A FORWARD -d cs1.yahoo.com -j DROP
> > iptables -A FORWARD -d cs2.yahoo.com -j DROP
> > iptables -A FORWARD -d cs3.yahoo.com -j DROP

> Ive already tried this about a month ago and but theres an error saying
> that "host/network 'cs1.yahoo.com' not found" ... this is also treu with
> cs2 and cs3 ...hmmm am i the only one getting this kind of error? Pls tell
> me

You have DNS problems.

Shouldn't matter, you're better off using the relevant IP addresses anyway.

-- 
FunkyJesus System Administration Team


