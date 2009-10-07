From: Fabio Marcone <fabio.marcone@duet.it>
Subject: Re: tc and CONNMARK [SOLVED]
Date: Wed, 07 Oct 2009 13:41:35 +0200
Message-ID: <4ACC7E6F.5050106@duet.it>
References: <4AC9BD2E.301@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AC9BD2E.301@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Thanks to all for your help.
>
> Starting a single connection (upload or download) traffic is limited 
> correctly but if I start two connection (one in upload and the other 
> in download) I note that the one in upload runs correctly (how in the 
> previous test) but the one in download stalls and then send some 
> packets and then stalls alternatively.

I solve using sfq to htb leaves, in this way this two flows share the 
bandwidth correctly.

Fabio
