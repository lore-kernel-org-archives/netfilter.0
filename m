From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Own logfile
Date: Wed, 7 Jan 2004 22:27:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401072227.21898.Antony@Soft-Solutions.co.uk>
References: <001c01c3d56c$d064d840$0600a8c0@blackbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001c01c3d56c$d064d840$0600a8c0@blackbox>
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

On Wednesday 07 January 2004 10:22 pm, Christian Gmeiner wrote:

> Hi everybody.
>
> I am working to wirte a little firewall. Everything works fine and now i
> want to use an own log file to write down if i got hacked, portscaned,....
> Is this possible with iptables?

Try the ULOG target.

Antony.

-- 
Having been asked for a reference for this man,
I can confirm that you will be very lucky indeed if you can get him to work 
for you.

                                                     Please reply to the list;
                                                           please don't CC me.


