From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: ssh agent timeout
Date: Wed, 19 Mar 2008 23:44:31 +0100
Message-ID: <006201c88a12$cbcccc20$63666460$@info>
References: <frrud8$l0p$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <frrud8$l0p$1@ger.gmane.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> On FC8, how can I change the value the ssh
> agent timeout? Is it in some file?

I don't think this question is appropriate for the Netfilter list and I'm not even sure what you mean by "ssh agent". However, if you're talking about the OpenSSH ssh client, type "man ssh_config" and search for "timeout".


Grts,
Rob


