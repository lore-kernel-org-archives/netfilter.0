From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: forged DCC command
Date: Sat, 25 Sep 2004 05:36:45 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409250536.46141.Alistair@nerdnet.ca>
References: <20040925080604.11381.qmail@web90004.mail.scd.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040925080604.11381.qmail@web90004.mail.scd.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On September 25, 2004 04:06 am, Linux Query wrote:
> Hi!
>
>
> I got this message on my linux router (RedHat 9)
>
> >>Forged DCC command from x.x.x.x: y.y.y.y:1024
>
> where x.x.x.x is the ip address of an internal pc
> and y.y.y.y is my public ip
>
> Can anybody please tell me what it means and if I
> should block the particular internal pc .

	It means that one of your internal pc clients is attempting a DCC send/expect 
and is misconfigured.  The internal client is using your external IP address.  
Since you (from the message) have the contrack/nat for irc loaded, they are 
calling this forged.  Reconfigure the client to use its own internal ip NOT 
the ip it gets told it has from the server.  I believe that both MIRC and 
Oskar Andreasson have my original, detailed instructions on how to do this on 
their sites.

Alistair Tonner



>
> regards,
> Jim.
>
>
>
> _______________________________
> Do you Yahoo!?
> Declare Yourself - Register online to vote today!
> http://vote.yahoo.com

