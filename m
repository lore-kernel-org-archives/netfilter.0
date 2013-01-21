From: Born Without <blackhole@airpost.net>
Subject: Re: Wrapper script for ipset listing
Date: Mon, 21 Jan 2013 09:31:39 +0100
Message-ID: <50FCFCEB.5020704@airpost.net>
References: <50E84F5E.8060704@airpost.net> <alpine.LNX.2.01.1301051809460.23031@nerf07.vanv.qr> <50E8F495.40307@airpost.net> <alpine.LNX.2.01.1301062030320.14070@nerf07.vanv.qr> <alpine.DEB.2.00.1301070852290.591@blackhole.kfki.hu> <50ED13BC.6010005@airpost.net> <20130109115232.GA19321@1984>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=Z0DD/YtSRiO3D31/xcwCFkOiPFI=; b=MolISCCA7n2/vKzHl2
	vBfBmgX8SL9pZ1fw7fWo6kCaSE3yGZADBDwOaLtJOjvt7PUl9K4IYxQzPUf4nTiP
	N5qvvm8guwg3s/TrgV/EdvPutG+hhIr1vm0BKJ0/ZAgifFMCobseTRv3ncyz3tm8
	MU0VYloeMbbuVnbv47ENh7FX4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=Z0DD/YtSRiO3D31/xcwCFk
	OiPFI=; b=m9ItUZww60gIaTWUztWvyGN4cUs6UT0fTPtwYMXx52x2RfqKCsqixS
	R4h3E+75B0Ne3Q9GGrm+UuGvpqfGf1+aMtRC96Mohrm5V+BpvolY3cAB+7qgct2y
	bWKlRimzYF323LKEFVg9CLb1o0X0+4gpT5MGdOXXeGEfdI3mQjD1w=
In-Reply-To: <20130109115232.GA19321@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Eliezer Croitoru <eliezer@ngtech.co.il>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

[...]
>>>>>>> As I was missing those features in the ipset set listing capabilities:
>>>>>>>
>>>>>>> - show sum of set members
>>>>>>> - suppress listing of headers
>>>>>>> - choose a delimiter character for separating member entries
>>>>>>>
>>>>>>> I wrote a little wrapper script (for the bash shell) to support them.
[...]

Good day everybody!

over the past two weeks I kept having ideas and implementing them.
The functional additions are:

- show sets which match an arithmetic comparison (==|!=|<|>|<=|>=) on 
the sum of their elements.

- match on any header entry using an (ext)glob pattern. multiple 
selections are ANDed and only sets containing all patterns are displayed.

- allow arithmetic comparison on any header with an integer value. 
multiple selections are ANDed and only sets containing all patterns are 
displayed.

- match on set elements using either a (ext)glob, or a regex (=~ 
operator) pattern. Sum of matches can be displayed with the -c option.

- added some shortcut options to match on header entries:
    -Ht   - match on set type.
    -Hr   - match on number of references.
    -Hs   - match on size in memory.
    -Hv   - match on the revision number.


I hope those features can be considered useful. opinions welcome.
Now I'm running out of ideas, so if anybody has some, I'll be gladly 
considering any input.

I also reworked the help text (-h). But I've never done this before, so 
I'm not sure if it's accurate and understandable. I'll paste it here, 
maybe somebody here can tell me if I did something wrong.

./ipset_list -h

  ipset set listing wrapper script

ipset_list [option [opt-arg]] [set-name] [...]

ipset_list -h | -n
ipset_list -t [-c] [-Mc [!|<|>|<=|>=]value]
         [-Fh header-glob:value-glob] [...]
         [-Fi header-glob:[!|<|>|<=|>=]value] [...] [-Ht type-glob]
         [-Hr|-Hs|-Hv [!|<|>|<=|>=]value] [set-name] [...]
ipset_list -i [-r|-s] [-d char] [-Fg|-Fr pattern] set-name
ipset_list [-a|-c|-m|-r|-s] [-d char] [-Mc [!|<|>|<=|>=]value]
         [-Fh header-glob:value-glob] [...]
         [-Fi header-glob:[!|<|>|<=|>=]value] [...]
         [-Fg|-Fr pattern] [-Ht type-glob]
         [-Hr|-Hs|-Hv [!|<|>|<=|>=]value] [set-name] [...]

options:
-a       show all information but with default delim (whitespace).
-c       calculate members and match (-Fg|-Fr) sum.
-d delim       delimiter character for separating member entries.
-h       show this help text.
-i       show only the members of a single set.
-m       show set members.
-n       show set names only (raw `ipset list -n' output).
-r       try to resolve ip addresses in the output (slow!).
-s       print elements sorted (if supported by the set type).
-t       show set headers only.
-v       version information.

-Fg pattern    match set members using a [ext]glob pattern.
-Fr pattern    match set members using a regex (=~ operator) pattern.
-Fh header-glob:value-glob [...]
         show sets containing one or more ([ext]glob) matching headers.
-Fi header-glob:[!|<|>|<=|>=]value [...]
         compare one or more integer valued header entries.
-Ht set-type-glob         match on set type.
-Hr [!|<|>|<=|>=]value    match on number of references (value=int).
-Hs [!|<|>|<=|>=]value    match on size in memory (value=int).
-Hv [!|<|>|<=|>=]value    match on revision number (value=int).
-Mc [!|<|>|<=|>=]value    match on member count (value=int).


I hope with this and the examples in the code and on github, the 
features are well enough documented.

I've tested the script as much as I could, but sure some testers would 
be greatly welcome. So if anybody finds a bug, please let me know!

@Jozsef - please be sure to check github for eventually updated 
versions, in case you put it in /contrib for ipset release.

Code and description are here:
https://github.com/AllKind/ipset_list

Considered 'good' versions archives are here:
https://github.com/AllKind/ipset_list/tags

Thank you for your time and interest!

Best regards
