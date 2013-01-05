From: Born Without <blackhole@airpost.net>
Subject: Re: Wrapper script for ipset listing
Date: Sat, 05 Jan 2013 17:16:09 +0100
Message-ID: <50E851C9.6010404@airpost.net>
References: <50E84F5E.8060704@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030105060207050107040703"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type; s=mesmtp; bh=otZXRxOH05fwXjzrnePCo/ka
	eNw=; b=j3/tXIzqABAX0k6XZvE2DlE7JnNd+BGGFpgNnVbPEDW1DiqbUrwh4lBt
	FOJVMpcUYS67wMBCR1g34/UxDwfRuuZ0S2oUhJaikGH2hlcsNH9hHiCpkS9eytbK
	d423Bq9RMtwTCWsMQ5VFOgovKGhXV6YdqEutL3BI2olhi1YLtSQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:subject:references:in-reply-to:content-type; s=
	smtpout; bh=otZXRxOH05fwXjzrnePCo/kaeNw=; b=qBiy3Td3tQAYKA9mWkEN
	RqQZP3LbY1Cv0U/7mBiRkNGP275PiLYXTYyMPFshq0WDCYabehQyqAug0/XOfkxd
	8vbtMshlyCdyTRV7xHZ+R29N4N+WVQyPxnPHMF+LAIJntuW8IeVKS6njSFPUGZmz
	9qN0+bX172zeHHcng3CVbUY=
In-Reply-To: <50E84F5E.8060704@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030105060207050107040703
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05.01.2013 17:05, Born Without wrote:
> Hello list!
>
> As I was missing those features in the ipset set listing capabilities:
>
> - show sum of set members
> - suppress listing of headers
> - choose a delimiter character for separating member entries
>
> I wrote a little wrapper script (for the bash shell) to support them.
> For those who like, you'll find it attached.
>
> Comments etc. welcome...
>
> Best regards

Just noticed, that for sets with 0 members the sum is not shown.
Attached version changes that.
Sorry for the noise.

Best regards

--------------030105060207050107040703
Content-Type: text/plain; charset=windows-1252;
 name="ipset_list.bash"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ipset_list.bash"

#!/bin/bash

# -----------------------------------------------------------------
ipset="/sbin/ipset"
delim=" "
TMOUT=30
# -----------------------------------------------------------------

set -f
shopt -s extglob

show_count=0 show_members=0 headers_only=0 names_only=0 i=0

[[ -x $ipset ]] || {
	printf "ipset binary \`%s' does not exist, or is not executable" "$ipset"
	exit 1
}
while (($#)); do
	case "$1" in
		-h) printf "%s [-{c|h|m|n|r|s|t}] [...] [-d char] [set-name] [...]\n" "${0//*\//}"
			exit 0
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
		-s|-r) arr_par[i++]="$1"
			shift
		;;
		-o) if [[ $2 != plain ]]; then
				printf "only plain output is supported\n" >&2
				exit 2
			else
				shift 2
			fi
		;;
		-\!|-f) shift
		;;
		*) break
	esac
done
if ((names_only)); then
	if ((show_count || show_members)); then
		printf "options -n and -c|-m are mutually exclusive\n" >&2
		exit 2
	fi
	"$ipset" l -n
	exit $?
fi
if ((headers_only)); then
	if ((show_count || show_members)); then
		printf "options -t and -c|-m are mutually exclusive\n" >&2
		exit 2
	fi
	"$ipset" l -t
	exit $?
fi

i=0
if [[ $1 ]]; then
	arr_opts=("$@")
else
	while IFS=$'\n' read -r; do
		arr_opts[i++]="$REPLY"
	done < <("$ipset" l -n)
	i=0
fi

for x in "${!arr_opts[@]}"; do
	while read -r; do
		if [[ $REPLY = Name:* ]]; then i=0
			printf "\n%s\n" "$REPLY"
			continue
		elif [[ $REPLY = @(Type|Revision|Header|Size in memory|References|Members):* ]]; then
			continue
		elif [[ -z $REPLY ]]; then
			continue
		else
			if ((show_members)); then
				printf "%s$delim" "$REPLY"
			fi
			let i+=1
		fi
	done < <("$ipset" l "${arr_opts[x]}" "${arr_par[@]}")
	if ((show_members)); then
		printf "\n"
	fi
	if ((show_count)); then
		printf "Member count: %d\n" $i
	fi
done

--------------030105060207050107040703--
