From: Georgi Alexandrov <g.alexandrov@bgservice.net>
Subject: Re: I have the script with the rules, what now?
Date: Tue, 23 Mar 2004 13:55:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <406025BD.605@bgservice.net>
References: <086C43C9A9A1A541BFDFABCFDA05F58902094668@mailnew.tecnun.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <086C43C9A9A1A541BFDFABCFDA05F58902094668@mailnew.tecnun.es>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Arrizabalaga, Saioa wrote:

>Hi everyone,
>
>I am a newbie, and I am probably asking a silly question, but anyway!
>
>I have 3 network cards (2 for internal networks and the other one to
>Internet), and I have already started with my ruleset and have made a
>script, based on the scripts I have found in several HOWTOs and
>tutorials.
>
>My question is: how do I execute this script now?
>
>Thanks in advance
>
>Saioa
>
>
>
>  
>
it's probably a bash/sh script, right ?
so the simplest way:
sh mynewfwscript should do,
or chmod +x mynewfwscript and ./mynewfwscript

