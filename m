From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: PPTP passthrough
Date: Thu, 4 May 2017 20:46:12 +0200
Message-ID: <8b5bcc32-f343-e961-55e8-bbc03aa29234@plouf.fr.eu.org>
References: <6d2c9c2f-2636-9e3f-b8e1-eec95eb02370@suse.com.au>
 <86316f95-37e3-8f80-d9ee-c4f6c428ff1c@sterenborg.info>
 <af6f998e-1d52-9939-4408-16ff1193b167@suse.com.au>
 <8fc0c61c-c86e-4377-0480-08db819b7a59@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8fc0c61c-c86e-4377-0480-08db819b7a59@sterenborg.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "Rob Sterenborg (Lists)" <lists@sterenborg.info>, Steven O'Connor <steven@suse.com.au>, netfilter@vger.kernel.org

Le 04/05/2017 à 08:07, Rob Sterenborg (Lists) a écrit :
>
> IIRC something changed with autoloading helper modules (don't know
> exactly when): are the PPTP helper modules loaded?

AFAIK, helper modules were never autoloaded.
It is automatic helper assignment that was disabled by default, so a 
helper must be explicitly attached to a connection with the CT target.
