From: Born Without <blackhole@airpost.net>
Subject: Re: Wrapper script for ipset listing
Date: Wed, 09 Jan 2013 07:52:44 +0100
Message-ID: <50ED13BC.6010005@airpost.net>
References: <50E84F5E.8060704@airpost.net> <alpine.LNX.2.01.1301051809460.23031@nerf07.vanv.qr> <50E8F495.40307@airpost.net> <alpine.LNX.2.01.1301062030320.14070@nerf07.vanv.qr> <alpine.DEB.2.00.1301070852290.591@blackhole.kfki.hu>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080800070107020809020505"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type; s=mesmtp; bh=l2Osch8FJiClS
	IFfZeNmW0M2nNw=; b=fgmEbEGzGw1cWxfu2VInNDtYoxU3wSymIlufpIpMe4oPY
	4C72Eb3CE8IwvgskTGh6RFpNwH7klZ+0f241ECo/9k0U+3XEVuoZAZzAomLSRK9p
	gdm6phF9o6nTiprXvJ3mGKq5oZn//u6Ydig+HrpBsVo3r7K7lE/EmRSZwoL7hk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type;
	 s=smtpout; bh=l2Osch8FJiClSIFfZeNmW0M2nNw=; b=FsBi0I4brGFU+cRLC
	CpW+P0ZaHD54N94hJleoPlL3+kc6BHll2sGFpqpkwCgyHRf4GOQ4Husk4Z3VGE66
	TJ/VkZ3Fp9dXKoRwotiCcjJPy1ciR1XczwpVlpXx9ynz/waBtkwrINLWIg6ZY3oA
	dI1GSIKsDKVxs1STmf2AWCni4M=
In-Reply-To: <alpine.DEB.2.00.1301070852290.591@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Jan Engelhardt <jengelh@inai.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080800070107020809020505
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07.01.2013 08:59, Jozsef Kadlecsik wrote:
> On Sun, 6 Jan 2013, Jan Engelhardt wrote:
>
>> On Sunday 2013-01-06 04:50, Born Without wrote:
>>>>> As I was missing those features in the ipset set listing capabilities:
>>>>>
>>>>> - show sum of set members
>>>>> - suppress listing of headers
>>>>> - choose a delimiter character for separating member entries
>>>>>
>>>>> I wrote a little wrapper script (for the bash shell) to support them.
>>>>> For those who like, you'll find it attached.
>>>>
>>>> There's libipset, with which this task should be achievable to the
>>>> maximum customizable degree without involving ugly text parsing with sh.
>>>
>>> good you mention libipset, because not even the man page does, nor does any
>>> documentation or similar exist.
>>
>> I have taken Joszef into Cc..

[...]

>
> In order to parse the output produced by ipset, one should take into
> account the followings:
>
> - New header elements may appear but the header part is always
>    started by "Name:" and ended by "Members:".
> - New value parameters may appear but those are appended to the existing
>    ones.
>
> If those "rules" are taken into account, then shell/perl/etc scripts can
> safely parse the output.
>

Thank you Joszef for that information.
I've taken it into account and adapted the script.
Also added:
-a parameter to act just like 'ipset list', but with whitespace as 
default delim.
comments and examples.

Best regards

--------------080800070107020809020505
Content-Type: text/plain; charset=windows-1252;
 name="ipset_list.bash"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ipset_list.bash"

#!/bin/bash

# -----------------------------------------------------------------
# ipset set listing wrapper script
# -----------------------------------------------------------------
# Examples:
# $0                 - no args, just list set names
# $0 -c              - show all set names and their member sum
# $0 -t              - show all sets, but headers only
# $0 -c -m setA setB - show members and sum of setA & setB
# $0 -a -c -d :      - show all sets members, sum and use `:' as entry delimiter
# $0 -c -m -d $'\n' setA - show members and sum of setA, delim with newline
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# Modify here
# -----------------------------------------------------------------
# path to ipset
ipset="/sbin/ipset"

# default delimiter character
delim=" "

# default read timeout
TMOUT=30
# -----------------------------------------------------------------

set -f
shopt -s extglob

show_all=0 show_count=0 show_members=0 headers_only=0 names_only=0 in_header=0 i=0

[[ -x $ipset ]] || {
	printf "ipset binary \`%s' does not exist, or is not executable" "$ipset"
	exit 1
}
while (($#)); do # parse cmd-line options
	case "$1" in
		-h) printf "ipset set listing wrapper script\n"
		   	printf "%s [-{a|c|h|m|n|r|s|t}] [...] [-d char] [set-name] [...]\n" "${0//*\//}"
			exit 0
		;;
		-a) show_all=1
			shift
		;;
		-c) show_count=1
			shift
		;;
		-m) show_members=1
			shift
		;;
		-n) names_only=1
			shift
		;;
		-t) headers_only=1
			arr_par[i++]="$1"
			shift
		;;
		-s|-r) arr_par[i++]="$1"
			shift
		;;
		-d) if [[ -z $2 ]]; then
				printf "delim character is missing\n" >&2
				exit 2
			else
				if ((${#2} > 1)); then
					printf "only one character is allowed as delim\n" >&2
					exit 2
				fi
				delim="$2"
				shift 2
			fi
		;;
		-o) if [[ $2 != plain ]]; then
				printf "only plain output is supported\n" >&2
				exit 2
			else
				shift 2
			fi
		;;
		-\!|-f) printf "unsupported option: \`$1'\n" >&2
				exit 2
		;;
		*) break
	esac
done

# option logic
if ((names_only && headers_only)); then
	printf "options -n and -t are mutually exclusive\n" >&2
	exit 2
elif ((headers_only)); then
	if ((show_count || show_members || show_all)); then
		printf "options -t and -a|-c|-m are mutually exclusive\n" >&2
		exit 2
	fi
elif ((names_only)); then
	if ((show_count || show_members || show_all)); then
		printf "options -n and -a|-c|-m are mutually exclusive\n" >&2
		exit 2
	fi
	"$ipset" l -n
	exit $?
fi

# sets to work on (no arg means all sets)
i=0
if [[ $1 ]]; then
	arr_opts=("$@")
else
	while IFS=$'\n' read -r; do
		arr_opts[i++]="$REPLY"
	done < <("$ipset" l -n)
	i=0
fi

# read sets
for x in "${!arr_opts[@]}"; do
	while read -r; do
		case "$REPLY" in
			"") : ;;
			Name:*) # header opened
				if ((in_header)); then
					printf "unexpected entry: \`%s' - header not closed?\n" "$REPLY" >&2
					exit 1
				fi
				i=0 in_header=1
				printf "\n%s\n" "$REPLY"
			;;
			@(Type|Header|Size in memory|References):*) # header entry
				if ((headers_only || show_all)); then
					printf "%s\n" "$REPLY"
				fi
			;;
			Revision:*) # header entry (closes header on -t)
				if ((headers_only)); then
					in_header=0
					printf "%s\n" "$REPLY"
				elif ((show_all)); then
					printf "%s\n" "$REPLY"
				fi
			;;
			Members:*) # header entry (closes header if not -t)
				in_header=0
				if ((show_all)); then
					printf "%s\n" "$REPLY"
				fi
			;;
			*) # member entry
			   	if ((in_header)); then
					printf "unexpected entry: \`%s'\n" "$REPLY" >&2
					exit 1
				fi
				if ((show_members || show_all)); then
					printf "%s$delim" "$REPLY"
				fi
				let i+=1
		esac
	done < <("$ipset" l "${arr_opts[x]}" "${arr_par[@]}")
	if ((show_members || show_all)) && [[ $delim != $'\n' ]]; then
		printf "\n"
	fi
	if ((show_count)); then
		printf "Member count: %d\n" $i
	fi
done

--------------080800070107020809020505--
