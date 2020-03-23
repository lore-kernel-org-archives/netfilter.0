From: Marc SCHAEFER <schaefer@alphanet.ch>
Subject: Re: tc question about ingress bandwidth splitting
Date: Mon, 23 Mar 2020 10:36:47 +0100
Message-ID: <20200323093647.GA4706@alphanet.ch>
References: <1D33C8C0-0638-4566-A85F-80B19CD532BA@redfish-solutions.com>
 <8ce39670-f41d-4053-b424-bfbfe23c0329@swifty.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8ce39670-f41d-4053-b424-bfbfe23c0329@swifty.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?B?R+FzcOFy?= Lajos <swifty@swifty.hu>
Cc: Philip Prindeville <philipp_subx@redfish-solutions.com>, netfilter@vger.kernel.org

On Mon, Mar 23, 2020 at 07:47:11AM +0100, G=E1sp=E1r Lajos wrote:
> Just a tip: AFAIK, you can only limit your sending bandwith... Everything
> what you already received is already on your device... :)

Right, however in case you do not have control on the sending
device, you can slow down or loose TCP ACKs to slow down
the opposite direction TCP traffic.
