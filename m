From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: AW: Firewall workaround
Date: Fri, 16 Jan 2004 18:10:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401161810.29026.Antony@Soft-Solutions.co.uk>
References: <357895CFC8CB7C44900D6A4F46D08AA90459CF@exchangeserver.IAT.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <357895CFC8CB7C44900D6A4F46D08AA90459CF@exchangeserver.IAT.local>
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

On Friday 16 January 2004 5:45 pm, Benjamin Dickgiesser wrote:

> I don't know much about ssh forwarding, but I don't think it would be very
> useful in my case. As far as I know you have to specify the server ip for a
> port to forward. I want to be able to connect to any server on any port.

Yes, you are correct - you have to tell SSH where to forward the port to.

I thought you meant you wanted to bypass the firewall filtering and access 
some (specific) machines using protocols which were being blocked, but if you 
want to have a more general routing solution then I agree that a VPN is the 
way to go.

Antony

-- 
I want to build a machine that will be proud of me.

 - Danny Hillis, creator of The Connection Machine

                                                     Please reply to the list;
                                                           please don't CC me.


