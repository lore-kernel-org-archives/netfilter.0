From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Hostname with DNAT  ? {OK}
Date: Tue, 27 Jul 2004 09:44:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407270944.52819.Antony@Soft-Solutions.co.uk>
References: <D5C9032B2B09C64EA2409D6214E91AC90511F6@asimail2.alphanumeric.com> <007101c473af$108ddc60$da0da8c0@pisic>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007101c473af$108ddc60$da0da8c0@pisic>
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

On Tuesday 27 July 2004 8:54 am, Danila Octavian wrote:

> I'm afraid i was not very explicit ...
>
> I was trying to use strictly names and that's why :
>
> I have only one public IP and 3 diferrent names. Behind the machine i have
> a network with 4 servers which use that names :

In that case set up one mail relay (which only accepts mail for the four 
domains), feed all external MX records to this one server, and then configure 
it to relay mail for each domain on to each appropriate server.

What you are trying to do is an application layer requirement; netfilter 
cannot do this for you at the network routing layer.

Regards,

Antony.

-- 
I love deadlines.   I love the whooshing noise they make as they go by.

 - Douglas Noel Adams

                                                     Please reply to the list;
                                                           please don't CC me.


