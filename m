From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: For Mailers
Date: Sat, 6 Nov 2004 11:53:18 -0500
Message-ID: <200411061153.18865.Alistair@nerdnet.ca>
References: <000101c4c413$f014bc50$0b0210ac@mangesh>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000101c4c413$f014bc50$0b0210ac@mangesh>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On November 6, 2004 10:18 am, Mangesh Rakhunde wrote:
> Hi
>  Can we put any filters for mail attachments. Like discarding mails with
> infected attachments

 No, iptables works at a lower layer of the stack than would be required for 
this -- 
 Mail daemons have lots of addons to manage virus scanning of incoming and 
outgoing mail .... including dumping infected emails/marking them etc.

 Alistair.

> Regards
>
> Mangesh

