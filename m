From: Marek Zachara <marek.zachara@conexe.pl>
Subject: Re: limit connection
Date: Sun, 2 Oct 2005 09:47:55 +0200
Message-ID: <200510020947.56101.marek.zachara@conexe.pl>
References: <433EF2AF.40005@neostrada.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <433EF2AF.40005@neostrada.pl>
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

On Saturday 01 of October 2005 22:33, Piotr Holubniak wrote:
> Hello everyone
>
> Is it possisble to limit number of connections which can be established
> from one IP address?
> I mean if  sender reaches limited number of connections, no more
> connections can be established from this host, but other host still can
> connect . I rather think about global limit not for certain IP address.
>

try this:

iptables -A FORWARD -p tcp --syn -s $source_ip -o $ext_interface -m connlimit 
--connlimit-above $number_of_allowed_connections -j REJECT

Marek

