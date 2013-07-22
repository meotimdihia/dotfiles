alias 1='cd /var/www/'
alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add'
alias svndelall='svn status | grep "^\!" | awk "{print \$2}" | xargs svn delete'

if type apache2 2>/dev/null; then
	alias a2reload='sudo service apache2 reload'
	alias a2restart='sudo service apache2 restart'
elif type httpd 2>/dev/null; then
	alias a2reload='sudo service httpd reload'
	alias a2restart='sudo service httpd restart'
else
	alias a2reload='sudo /etc/init.d/apache2 reload'
	alias a2restart='sudo  /etc/init.d/apache2 restart'
fi

function gcp()
{
	git add * && git commit -am "$1" && git push
}
choose () {
    local PS3="Choose a file to edit: "
	select opt in $(locate "$1") quit
	do
		if [[ $opt = "quit" ]]
		then
			break
		fi
		${EDITOR:-vim} "$opt"
	done
}

alias ll='ls -alF'
alias la='ls -la'
alias l='ls -CF'

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

