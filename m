From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Deleting a rule from a DNAT chain
Date: Wed, 23 Mar 2005 18:25:03 -0600
Message-ID: <424208DF.30709@riverviewtech.net>
References: <B00976467560E749B3E981F36CA7D6B3146520@centratel01.telecoms.local>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <B00976467560E749B3E981F36CA7D6B3146520@centratel01.telecoms.local>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eugene Joubert <eugenej@centratec.co.za>
Cc: netfilter@lists.netfilter.org

iptables -t nat -D PortForwarding_3191 <rule number from the top of the list starting with 1>



Grant. . . .

Eugene Joubert wrote:
> Hi,
> 
> I'm a little rusty. I need to delete a rule from a NAT user defined
> chain. The chain is called PortForwarding_3191. I know to use -D but my
> syntax is up to crap.
> I did not create the rule myself as it was created by some sort of
> webinterface.
> Any help on the syntax will be appreciated.
> 
> Regards,
> Eugene
> 

