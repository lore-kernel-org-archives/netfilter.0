From: Jason Opperisano <opie@817west.com>
Subject: Re: allowing connection
Date: Fri, 10 Sep 2004 16:24:14 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094847854.1900.192.camel@wolfpack.ljm.dom>
References: <20040910181819.GA31430@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040910181819.GA31430@tranquility.scriptkitchen.com>
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
To: netfilter@lists.netfilter.org

On Fri, 2004-09-10 at 14:18, Payal Rathod wrote:
> Hi,
> Right now I am allowing only my client's LAN access one of my 
> design's machine from the internet. Their LAN is a simple network,
> with a single IP and other machines are masqueraded. Now I want to allow
> only one of their machine to access my machine. Can I do it? I mean 
> the machine is on 192.168.1.x series of IP, but can I restrict it
> on mac address basis? If yes, how do I do it?
> 
> With warm regards,
> -Payal

so essentially:

+------------+  +----------------+
| CLIENT LAN |--| CLIENT MACHINE |
+------------+  +----------------+
      |
+-----------+
| CLIENT FW |
+-----------+
      |
      |
+----------+
| INTERNET |
+----------+
      |
      |
+---------+
| YOUR FW |
+---------+
      |
+---------+  +----------------+
|YOUR LAN |--| DESIGN MACHINE |
+---------+  +----------------+

Right you allow whatever IP all of "Client LAN" is MASQ'ed behind to 
access "Design Machine."

To answer the question, can you filter by MAC address--the answer is 
a resounding, "no!"  The MAC address of "Client Machine" is stripped 
off by "Client FW" never to be seen again by any network device.

The only MAC address that you'll see on the external interface of
"Your FW" is that of your Internet router.

My suggestion:  protect the resource in question with a
username/password or certificate or whatever authentication suits you.
Only give the one person who needs access credentials to get in.
Keep the filtering policy as-is.

-j

-- 
Jason Opperisano <opie@817west.com>


