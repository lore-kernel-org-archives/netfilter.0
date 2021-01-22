From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Use case of nftables + Linux combination as network firewall
Date: Fri, 22 Jan 2021 15:27:40 +0100
Message-ID: <636ad821-67fe-d28c-8a55-47fbf00877bc@thelounge.net>
References: <CAEx-Y1-yWpUcfQKe_gkkuEhpRr2Nm59CjRp61dA5-GS8os5ihw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEx-Y1-yWpUcfQKe_gkkuEhpRr2Nm59CjRp61dA5-GS8os5ihw@mail.gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Younwook Jang <younwook@gmail.com>, netfilter@vger.kernel.org



Am 22.01.21 um 14:31 schrieb Younwook Jang:
> Dear netfilter users,
> 
> I'm looking that real reference case that uses nftables+Linux server
> as network firewall.
> 
> Would you please share reference cases or related information ?
> 
> I think that Linux VM with well-configured nftables can be act as
> network firewall especially cloud environment.
> 
> Please share your advice

it's exactly the same as you do for INPUT with iptables/nftables but in 
the FORDWARD chain

on the pure network layer without inspecting content every middlebox you 
can buy does exactly the same and in many cases is just using linux + 
iptables
