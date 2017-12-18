From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: Nftables atomic reload at reboot
Date: Mon, 18 Dec 2017 11:08:21 +0100
Message-ID: <CAOkSjBj6VcnAmQPV8Bdz+pfckGKKZ2SDvG=T84gwCq3ZmVvpJw@mail.gmail.com>
References: <69931d71-baa9-d2ae-9a43-242aeb6a709f@justdev.ca>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <69931d71-baa9-d2ae-9a43-242aeb6a709f@justdev.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff <jarvis@justdev.ca>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 17 December 2017 at 23:02, Jeff <jarvis@justdev.ca> wrote:
> Hey folks! I'm having some trouble getting nftables to do what I want so
> I wanted to throw this out there and see how other folks tackle the
> problem:
>
> How do you have your nftables-based firewall configured to start at
> boot? What I mean is, do you have everything in /etc/nftables.conf as
> per the Scripting page on the nftables wiki and you just load it with
> 'nft -f' at boot, or do you export your rules at shutdown and import
> them again at boot with 'nft -f'? Or something else entirely?
>

I maintain a ruleset.nft file and load it at boot with `nft -f'.

> My goal is to have /etc/nftables.conf where I can add or remove firewall
> rules, and be able to run 'nft -f /etc/nftables.conf' to reconfigure
> according to the changes in the file, so that I can write a systemd unit
> script to have nftables reload my rules at reboot.  I've scoured the
> wiki (and added to it) but haven't yet figured out an approach I'm
> content with and since I'm starting to arrive at solutions involving
> bash scripting, which defeats the purpose of atomic rule replacement, I
> figure it's time to reach out for help.
>

You can find a systemd service file in Debian packages [0]

> Some of the problems that I'm hitting:
> - If I don't add a "flush table ..." to the beginning of
> /etc/nftables.conf then I end up with duplicate rules when I reload on
> an already configured system.
>
> - If I do add a "flush table $table" to the beginning then the counters
> for any existing rules get wiped on reload (not the behavior I want but
> it's better than duplicate rules and does make sense given the command
> 'flush')
>
> - If I take an export of the ruleset and then try to reload it at boot,
> I hit errors because the table doesn't exist yet even though
> nftables.conf contains "table ip filter {..."
>
> - Separating the table creation (add table ip filter) and an include
> statement for /etc/nftables.conf out into /etc/nftables.conf.start and
> reloading that at reboot also throws errors about the table not existing
> and appears to ignore the add table line in /etc/nftables.conf.start
>
> - Reloading the firewall before all interfaces referenced in
> /etc/nftables.conf are up results in errors
>

Don't use 'iif', but 'iifname'.

> I'm using Debian Jessie
> Linux Kernel 3.16.0.4.686-pae

^^^
very old kernel, you lack interesting things like 'flush ruleset' and
other stuff that you will likely need.
Please, update. You have linux 4.9.51-1~bpo8+1 in debian jessie-backports [1]

> Nftables version 0.6-1~bpo8+1, installed from apt

Old as well. You could use 0.8-2 in Debian, but in this case 0.6 is
the latest in debian jessie [2]

> One interface referrenced from nftables rules isn't always up when
> nftables is reloaded
>

use "iifname ethX", the rule won't match until the interface is up,
but no problem in loading this rule.

[0] https://anonscm.debian.org/cgit/pkg-netfilter/pkg-nftables.git/tree/debian/nftables.service
[1] https://tracker.debian.org/pkg/linux
[2] https://tracker.debian.org/pkg/nftables
