From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Checksumming Issues
Date: Fri, 21 Nov 2003 20:47:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311212047.hALKljj29632@agate.rockstone.co.uk>
References: <D8FBABA1EF6F2E4DBCC88903F60691F3021BD92B@houxchsvr.ucscorp.ucs.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D8FBABA1EF6F2E4DBCC88903F60691F3021BD92B@houxchsvr.ucscorp.ucs.pvt>
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

On Friday 21 November 2003 8:42 pm, Hildebrand, Brian wrote:

> I had to check my packet generator source code, because I thought the TCP
> header was calculated the same way you do. But when I checked the source
> you have to feed both the TCP and IP headers into the calculation to get a
> correct checksum. It uses some information from the IP header in the
> calculation (source and destination IP for example). So you don't actually
> use the entire IP header, just a part of it.

It is not possible that the TCP checksum depends on IP information.

TCP is layer 4 of the OSI model; IP is layer 3.   The IP checksum includes 
the TCP contents, but not the other way around.

Antony.

-- 

There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly
                                                     Please reply to the list;
                                                           please don't CC me.

