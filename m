From: "U. George" <netbeans@gatworks.com>
Subject: Re: multiport needs `-p tcp', `-p udp' - Why?
Date: Sat, 27 Feb 2010 16:14:51 -0500
Message-ID: <4B898B4B.5050301@gatworks.com>
References: <4b8984a7.0ab6660a.24bd.1f7f@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4b8984a7.0ab6660a.24bd.1f7f@mx.google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: richard.horton@solstans.co.uk
Cc: netfilter@vger.kernel.org

It makes no diff to either udp or tcp - port address are at the same 
header offset. It does makes a difference if you want to test both in 
the rule. I only want to test ports with this rule.

On 02/27/2010 03:46 PM, richard.horton@solstans.co.uk wrote:
  And as each rule is distinct the line with multiport does not know you 
have already determined the protocol...
Ahhh, *But I know*. I designed the filter that way. If u want to *warn* 
me, then thats probably ok.
