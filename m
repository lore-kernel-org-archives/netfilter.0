From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Cannot Ping Local Network after Executing rc.firewall script
Date: Thu, 11 Mar 2004 23:15:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403112315.18267.Antony@Soft-Solutions.co.uk>
References: <002901c407f7$2577a0d0$36b4fea9@CYBERHUT.RUWI>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002901c407f7$2577a0d0$36b4fea9@CYBERHUT.RUWI>
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

On Friday 12 March 2004 5:59 am, Harish Sabnani wrote:

> Hi All,
>
> I am using Iptables with Ip Masquearde, with a simple rc.firewall script to
> share my internet connection for the last so many months, today I
> configured a new server with the same settings but after the script
> executes I am not able to ping computers in my local network and the moment
> I restart the Iptables I am able too?I just dont understand where I am
> going wrong?Any pointers will be apprecaited.

It sounds like your netfilter rules are not being loaded on startup.

Check your startup scripts (what, and where, they might be, depends entirely 
on your Linux distribution) to make sure that your ruleset is being loaded 
when the new system boots up.

Regards,

Antony.

-- 
If you can't find an Open Source solution for it, then it isn't a real 
problem.

                                                     Please reply to the list;
                                                           please don't CC me.


