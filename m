From: Kim Jensen <kimj@dawn.dk>
Subject: Re: Ip range
Date: Wed, 16 Apr 2003 19:11:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304161911.15257.kimj@dawn.dk>
References: <B5747F3DB39FD411884B00B0D07808CCB6CA30@server10>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <B5747F3DB39FD411884B00B0D07808CCB6CA30@server10>
Content-Disposition: inline
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
To: "Philippe Dhont   (Sea-ro)" <Philippe.Dhont@searo.be>, netfilter@lists.netfilter.org

On Wednesday 16 April 2003 17:22, Philippe Dhont (Sea-ro) wrote:
> Howdy,
>
> I use an IP range 10.60.10.10 and 10.165.10.10 and 192.168.50.10
> With subnet mask 255.255.0.0
> But in my firewall script i have to us 10.60.0.0/8
> And this shows up (off course) as 10.0.0.0 but if i use 10.60.0.0 i get an
> error that this is not right.
> How can i use the correct range so that i get 10.60.0.0 and 10.165.0.0 and
> 192.168.0.0 in my iptables ?
>
Netfilter is fairly simple when it comes to ranges, it follows some rules 
described in the networking concepts howto 
(http://netfilter.org/documentation/HOWTO//networking-concepts-HOWTO.html).

If you wish to use different ranges, then you must tell the netfilter this, 
otherwise it will, quite correctly, return an error.

In your case, you must split up you 10.x.x.x into several ranges, since you 
use a strange setup. Why don't you just simply use the full 10.x.x.x range?

/Kim


