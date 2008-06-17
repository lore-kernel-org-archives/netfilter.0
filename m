From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: ROUTE patch is not present in newer patch-o-matic-ng snapshots?
Date: Tue, 17 Jun 2008 10:40:56 +0200
Message-ID: <4170F7A4E7E04A77AF3E5B22BE7A8AE7@dcyb.net>
References: <8252340d0806170052n2fdba64ew3341034797191909@mail.gmail.com> <8252340d0806170054i5ef9c7cci686249fb1aca5543@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8252340d0806170054i5ef9c7cci686249fb1aca5543@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> Could someone tell me why the ROUTE patch is not present in newer
> patch-o-matic-ng snapshots? 

Because it's unmaintained and newer kernels can't be patched for the ROUTE
target.
Look for xtables with it's extensions and the TEE target.
http://dev.medozas.de/files/xtables/


Grts,
Rob


