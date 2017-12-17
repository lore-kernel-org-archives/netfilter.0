From: Jeff <jarvis@justdev.ca>
Subject: Nftables atomic reload at reboot
Date: Sun, 17 Dec 2017 14:02:16 -0800
Message-ID: <69931d71-baa9-d2ae-9a43-242aeb6a709f@justdev.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hey folks! I'm having some trouble getting nftables to do what I want so
I wanted to throw this out there and see how other folks tackle the
problem:

How do you have your nftables-based firewall configured to start at
boot? What I mean is, do you have everything in /etc/nftables.conf as
per the Scripting page on the nftables wiki and you just load it with
'nft -f' at boot, or do you export your rules at shutdown and import
them again at boot with 'nft -f'? Or something else entirely?

My goal is to have /etc/nftables.conf where I can add or remove firewall
rules, and be able to run 'nft -f /etc/nftables.conf' to reconfigure
according to the changes in the file, so that I can write a systemd unit
script to have nftables reload my rules at reboot.  I've scoured the
wiki (and added to it) but haven't yet figured out an approach I'm
content with and since I'm starting to arrive at solutions involving
bash scripting, which defeats the purpose of atomic rule replacement, I
figure it's time to reach out for help.

Some of the problems that I'm hitting:
- If I don't add a "flush table ..." to the beginning of
/etc/nftables.conf then I end up with duplicate rules when I reload on
an already configured system.

- If I do add a "flush table $table" to the beginning then the counters
for any existing rules get wiped on reload (not the behavior I want but
it's better than duplicate rules and does make sense given the command
'flush')

- If I take an export of the ruleset and then try to reload it at boot,
I hit errors because the table doesn't exist yet even though
nftables.conf contains "table ip filter {..."

- Separating the table creation (add table ip filter) and an include
statement for /etc/nftables.conf out into /etc/nftables.conf.start and
reloading that at reboot also throws errors about the table not existing
and appears to ignore the add table line in /etc/nftables.conf.start

- Reloading the firewall before all interfaces referenced in
/etc/nftables.conf are up results in errors

I'm using Debian Jessie
Linux Kernel 3.16.0.4.686-pae
Nftables version 0.6-1~bpo8+1, installed from apt
One interface referrenced from nftables rules isn't always up when
nftables is reloaded

I should clarify that my /etc/nftables.conf is not using the scripting
language found on the nftables Scripting wiki page, I'm using the JSON
output from the export command which so far are working just fine when
fed back into nftables, with the exception of table creations. I'm
hoping it's not a fluke that this works, cause I notice the Scripting
wiki page doesn't mention this at all.


Thanks in advance for any thoughts or info, and thanks to everyone who
works on Netfilter and nftables! I look forward to adding what I learn
to the wiki :)
