From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Sun, 01 Jan 2012 14:24:43 -0600
Message-ID: <op.v7e9nhxox1lyi3@debiandesk2.net>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org, Anton Melser <anton@linux.com>

On Sun, 01 Jan 2012 10:10:51 -0600, Anton Melser <anton@linux.com> wrote:

> So, I have around 1600 public IPs in 4 blocks (3 x /23 + /25 on
> different ISPs). I have a certain number of machines (somewhere from 3
> to 8, needs to be variable and changeable without FW reconfiguration),
> and each one needs to be able to send email from each external IP (and
> needs to be able to do this deterministically). The only traffic
> should be to port 25 on the external destination IPs - the machines
> are only sending email, never receiving, so AFAICT everything can be
> closed inbound (at least for NEW).
> I thought that the best way to go would be to set up NAT using blocks
> in the 10.0.0.0 range. So say for each external IP I would have a /24,
> giving me up to 250-odd potential internal machines. So 10.1.1.1,
> 10.1.1.2, 10.1.1.3, etc. would map to 1.1.1.1; 10.1.2.1, 10.1.2.2,
> 10.1.2.3, etc. would map to 1.1.1.2, etc.
> I have been reading as many sites as I can but I can't work out the
> best way to go forward.

Hi,
I am new to this list and I have little experience with netfilter, but I think I can help you. However, I need some clarification:

When you say your machines need to be able to send email from each of those 1600 public IPs, do you mean your 3-8 machines serve as SMTP relays for 1600 hosts, each with a public IP?  Do you mean that you are *not* the ISP, and are providing only smtp service for the hosts?

-- 
Lloyd
