From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: New to IP Tables
Date: Thu, 14 Nov 2002 01:43:12 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211140143.gAE1hHe00663@vulcan.rissington.net>
References: <580E532D9F7A9B4BAE8A130848E0DDA702A0B751@franklin.narus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <580E532D9F7A9B4BAE8A130848E0DDA702A0B751@franklin.narus.com>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Thursday 14 November 2002 12:31 am, David Reta wrote:

> I just started using IP Tables and have a question. I was not able to find
> the answer in any of the docs I've read so far.
> I have a machine that I am using as a router and running Ip Tables on it.
> Here is a list of my tables.

Please repost your rules as the 'iptables' commands which are used to set 
them up, not the output of 'iptables -L' (this does not give all the 
information, and is not a friendly format for most of us to read).

Just as an offchance thought, have you got
echo 1 >/proc/sys/net/ipv4/ip_forward
somewhere in your startup scripts, so that the box can forward packets at 
all,even if they're not blocked by netfilter ?

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

