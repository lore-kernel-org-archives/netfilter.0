From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Hosts.Deny Question??
Date: Thu, 12 Sep 2002 14:16:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209121317.g8CDH2v10107@vulcan.rissington.net>
References: <000201c25a5d$e257d2e0$1be02a0a@infopart.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000201c25a5d$e257d2e0$1be02a0a@infopart.nl>
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

On Thursday 12 September 2002 2:49 pm, Niall Murphy wrote:

> thats what i mean sorry!! i have a red hat 7.2 firewall in front of a nt
> email and proxy server etc.
> but i want to use host.deny in the firewall rules to block certain ip
> and email addresses

You cannot use hosts.deny to control connections *through* a machine - it can 
only be used to restrict connections *to* the machine, and even then only to 
applications which use TCPwrappers.

As already discussed, use netfilter instead :-)

Antony.

-- 

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

