From: "Albert Cervera Areny" <informatic@sedifa.com>
Subject: Re: Block for MAC Address
Date: Fri, 14 Feb 2003 10:26:19 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <48797.80.26.113.199.1045214779.squirrel@www.clientes.sedifa.com>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAFXnZnPTWmEuxnKJINDeV
     5MKAAAAQAAAAbn072oWMbEu2LnhUyjfPEwEAAAAA@prodigy.net.mx>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAFXnZnPTWmEuxnKJINDeV
     5MKAAAAQAAAAbn072oWMbEu2LnhUyjfPEwEAAAAA@prodigy.net.mx>
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
Content-Transfer-Encoding: 7bit
To: Juan Carlos Hernandez Gonzalez <acuario1965@prodigy.net.mx>
Cc: netfilter@lists.netfilter.org

> Hi list:
>
> I have a linux red hat and need configure my iptables for permit only
> mac address of clients .. some know how make this .. Thanks
>

You should use -p mac and then match with --mac-source [!] address
For more info look at the iptables man page.

