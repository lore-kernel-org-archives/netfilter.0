From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Routing SMTP problem
Date: Fri, 14 Jun 2002 08:53:13 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206140753.g5E7rEA26724@Networker.rockstone.co.uk>
References: <1597F9D20963E347AC9E232F0F636DA8047BA2@server.skinners.highsun.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1597F9D20963E347AC9E232F0F636DA8047BA2@server.skinners.highsun.com.au>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Friday 14 June 2002 4:19 am, Ian Pollock wrote:

> Hi,
> Can anyone tell me if this is possible, we upgraded our internet access
> from isdn (small isp) to broadband (telstra). We had a static ip of
> eg:210.20.20.20 from our small isp on the isdn, with the new cable
> connection we get dhcp ip address which makes it hard for mail routing. Ok
> the big question can I alias the old static ip (small isp) we own of
> 210.20.20.20 to my external etho dhcp (from telstra) device (ip of
> 211.50.50.50) on my cable connection and route my mail through this way.

No.

There is nothing you can do which would achieve this, because packets to the 
ISDN address are going to get routed on the Internet to the small ISP, not to 
Telstra.   You cannot change that from your position on the end of either of 
the links.

 

Antony.

