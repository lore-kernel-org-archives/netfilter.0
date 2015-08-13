From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Creating a LAN only null routed network (no access to internet)
Date: Thu, 13 Aug 2015 02:31:39 -0400
Message-ID: <20150813023139.3d91a82d@playground>
References: <55CB462D.6040203@privatedemail.net>
	<55CC2DD4.6090706@privatedemail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <55CC2DD4.6090706@privatedemail.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: sillysausage <sillysausage@privatedemail.net>

On Thu, 13 Aug 2015 15:10:36 +0930
sillysausage <sillysausage@privatedemail.net> wrote:

> It does turn out I will need to buy myself a managed switch at some
> point and use VLANs instead of virtual interfaces if I want to assign IP
> addresses in this range. Virtual interfaces such as eth0:3 (192.168.3.1)
> currently have the same broadcast as eth0 (192.168.1.1) which would mean
> this will never work:

What happens if you don't use virtual IFs? That is, use multiple primary addresses:
  ip addr add 192.168.1.1/24 dev eth0
  ip addr add 192.168.2.1/24 dev eth0
  ip addr add 192.168.3.1/24 dev eth0

The system determines the correct broadcast address to use based on the source address. With correct primary CIDR addresses, you don't need to specify the broadcast address at all.

Or does this make your routing impossible to achieve?
