From: Ben <bench@silentmedia.com>
Subject: Re: simple nat question
Date: Tue, 2 Jul 2002 13:51:54 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.30.0207021347310.7072-100000@gilgamesh.eos.SilentMedia.com>
References: <02070222473004.03048@Lms>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <02070222473004.03048@Lms>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Humme <jan.humme@xs4all.nl>
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>, NetFilter <netfilter@lists.samba.org>

On Tue, 2 Jul 2002, Jan Humme wrote:

> No, I just wanted to point out that masquerading provides an easy way to get
> the desired results.

It does, true, but the howto recommends not using MASQ for static IPs. If
I had just done what told me what to do instead of worrying about problems
that didn't exist, I wouldn't have had to post this question to begin
with. :)

> On the other hand, taking into consideration the elegance of a one-line
> masquerading rule (one test) vs. your 4-line solution (more tests), would you
> still argue that a masquerading solution is less efficient?

Without a doubt, the (slightly) faster, (slightly) more complex solution
is better. It takes all of 30 minutes (if you're easily distracted) to get
this part of your firewall up and running, but it'll route packets for
months using the rules you choose.


