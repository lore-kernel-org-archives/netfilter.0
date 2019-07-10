From: Florian Westphal <fw@strlen.de>
Subject: Re: Question about nf_conntrack_proto for IPsec
Date: Wed, 10 Jul 2019 10:07:30 +0200
Message-ID: <20190710080730.c4bjujzkqcjxevmf@breakpoint.cc>
References: <CANpxKHHXzrEpJPSj3x83+WE23G1W0KPz9XbG=fCVzS21+-BpfQ@mail.gmail.com>
 <20190626111322.gks5qptax3iqrjao@breakpoint.cc>
 <CANpxKHGa6DpV-9n8La7wh6r7MbEZpzGTWOO1AhmhWv072b4LAg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANpxKHGa6DpV-9n8La7wh6r7MbEZpzGTWOO1AhmhWv072b4LAg@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Naruto Nguyen <narutonguyen2018@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, netdev@vger.kernel.org, netfilter@vger.kernel.org

Naruto Nguyen <narutonguyen2018@gmail.com> wrote:
> Could you please elaborate more on how generic tracker tracks ESP connection?

All protocols that do not have a more specific l4 tracker are tracked
based on l3 protocol + l4 proto number.

IOW, any ESP packet sent between the same endpoint addresses is seen
as matching a single esp flow.

We could easily add the ESP SPI as additional distinction marker if needed.
