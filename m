From: Kenneth Porter <shiva@sewingwitch.com>
Subject: Re: iptables script file
Date: Mon, 25 Oct 2004 14:28:55 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <B069AFB1CBDE6F6A01A304D9@[10.169.6.246]>
References: <200410252121.i9PLLSJx072272@jkcpub.iserver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200410252121.i9PLLSJx072272@jkcpub.iserver.net>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 'Netfilter Group' <netfilter@lists.netfilter.org>

--On Monday, October 25, 2004 5:26 PM -0400 Deepak Seshadri 
<dseshadri@broadbandmaritime.com> wrote:

> Which way would be easy to load a huge script that would be modified quite
> often?

iptables-restore

The save format is a little weird at first but it's not too hard to see how 
it matches your iptables commands. I now modify /etc/sysconfig/iptables 
directly. (This is the save file used on Red Hat systems to reload the 
firewall at boot time.)

If I understand things correctly, iptables-restore makes a single kernel 
call with only one lock, so it's very efficient at loading the tables into 
the kernel.

Change your script to write your rules into the save format and then invoke 
iptables-restore to load it. This is actually pretty simple, as most of 
your iptables commands will be replaced with "echo ${RULEBODY} > 
${SAVEFILE}" (where RULEBODY is the parameters to your old iptables 
command).



