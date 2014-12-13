From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Issue with specifying interface/NIC name with drop packets rule
Date: Sat, 13 Dec 2014 15:13:29 -0500
Message-ID: <201412131513.30049.neal.p.murphy@alum.wpi.edu>
References: <CAHRwiV37vEOmsFThw+Hhfjqb1SA05aZEUGBm1JQEB+-2WfnWWQ@mail.gmail.com> <CAHRwiV0AxxPXj7OW=V4_SLKKXirdDpb5mQj1eV4Pjia9JzHTBQ@mail.gmail.com> <CALPbv19G704czh3jKZmRpEgfdd65wxHsNpje=5n_UCr7qOOxsQ@mail.gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALPbv19G704czh3jKZmRpEgfdd65wxHsNpje=5n_UCr7qOOxsQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tuesday, November 25, 2014 12:45:35 PM Vijay Viswanathan wrote:
> ya,
> I faced same issue, the ipt library cannot be used directly. They
> warned in the Readme.

This doesn't really make sense; iptables itself has to use the lib directly. 
Miniupnpd and Smoothwall's ipbatch both use the lib directly.

N
