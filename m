From: Les Mikesell <les@futuresource.com>
Subject: Re: Restricting access to certain network interfaces for certain
	users
Date: Sun, 16 Jan 2005 13:03:06 -0600
Message-ID: <1105902186.10324.74.camel@les-home.futuresource.com>
References: <f8b495370501161012bc31285@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f8b495370501161012bc31285@mail.gmail.com>
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
To: Straxus <straxus@gmail.com>
Cc: netfilter@lists.netfilter.org

On Sun, 2005-01-16 at 12:12, Straxus wrote:

> I'm trying to limit which network interfaces a given user can access.
> I have two network cards (eth0 and eth1), and I've set up all sorts of
> virtual interfaces (eth0:0, eth0:1, etc) to give the cards multiple IP
> addresses.

I don't have a solution, but I've always considered it a bizarre
departure from the unix security model that Linux does not have
an underlying device in the filesystem with associated owner/group
that has to be opened before gaining access to the network.  Does
anyone know the history of this omission?  I wouldn't expect this
to apply to individual interfaces, but I thought that SysV had
something like /dev/tcp where permissions where applied.

-- 
  Les Mikesell
   les@futuresource.com



